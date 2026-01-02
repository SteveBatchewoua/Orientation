import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface TrainingProgram {
  id: number;
  jobTitle: string;
  institution: string;
  trainingPath: string;
  description: string;
  admissionDiploma: string;
  fee: string;
}

@Injectable({
  providedIn: 'root',
})
export class TrainingService {
  // Ensure this matches your launchSettings.json port (usually 5000-5200)
  private apiUrl = 'http://localhost:5000/api/training';

  constructor(private http: HttpClient) {}

  search(term: string): Observable<TrainingProgram[]> {
    if (!term.trim()) return new Observable((obs) => obs.next([]));
    const params = new HttpParams().set('query', term);
    return this.http.get<TrainingProgram[]>(`${this.apiUrl}/search`, {
      params,
    });
  }
}
