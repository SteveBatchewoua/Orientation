import { Pipe, PipeTransform, SecurityContext } from '@angular/core';
import { DomSanitizer, SafeHtml } from '@angular/platform-browser';

@Pipe({
  name: 'highlight',
  standalone: true,
})
export class HighlightPipe implements PipeTransform {
  constructor(private sanitizer: DomSanitizer) {}

  transform(value: string, search: string): SafeHtml {
    if (!search) return value;

    const escapedSearch = search.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    const re = new RegExp(escapedSearch, 'gi');
    const result = value.replace(
      re,
      (match) =>
        `<mark style="background: #ffd700; color: black; padding: 0 2px; border-radius: 3px;">${match}</mark>`
    );

    return this.sanitizer.bypassSecurityTrustHtml(result);
  }
}
