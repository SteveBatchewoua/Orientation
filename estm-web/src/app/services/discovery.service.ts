import { Injectable, inject, signal, computed } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { toObservable } from '@angular/core/rxjs-interop';
import { debounceTime, distinctUntilChanged, switchMap } from 'rxjs/operators';
import { DiscoveryItem } from '../models/discovery.model';

@Injectable({ providedIn: 'root' })
export class DiscoveryService {
  private http = inject(HttpClient);
  private apiUrl = 'http://localhost:5088/api/discovery';

  searchQuery = signal('');
  selectedType = signal<string>('Tout');
  selectedInstitution = signal<string>('Toutes');

  private remoteData = signal<DiscoveryItem[]>([]);

  private filters = computed(() => ({
    q: this.searchQuery(),
    type: this.selectedType(),
    inst: this.selectedInstitution(),
  }));

  constructor() {
    toObservable(this.filters)
      .pipe(
        debounceTime(500),
        distinctUntilChanged((a, b) => JSON.stringify(a) === JSON.stringify(b)),
        switchMap((filters) => {
          let params = new HttpParams();

          if (filters.q) {
            params = params.set('q', filters.q);
          }

          if (filters.type !== 'Tout') {
            params = params.set('type', filters.type === 'Métier' ? '0' : '1');
          }

          if (filters.inst !== 'Toutes') {
            params = params.set('institution', filters.inst);
          }

          return this.http.get<DiscoveryItem[]>(`${this.apiUrl}/search`, {
            params,
          });
        })
      )
      .subscribe((data) => this.remoteData.set(data));
  }

  filteredResults = computed(() => this.remoteData());

  getInstitutions = computed(() => [
    'Toutes',
    ...new Set(this.remoteData().map((d) => d.institution)),
  ]);
}
