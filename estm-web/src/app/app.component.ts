import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DiscoveryComponent } from './components/discovery/discovery.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, DiscoveryComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'Orientation Cameroun';
  isMenuOpen = signal(false);

  toggleMenu() {
    this.isMenuOpen.update((v) => !v);
  }
}
