import { bootstrapApplication } from '@angular/platform-browser';
import { provideHttpClient } from '@angular/common/http';
import { AppComponent } from './app/app.component';
import { injectSpeedInsights } from '@vercel/speed-insights';
bootstrapApplication(AppComponent, {
  providers: [provideHttpClient()],
});
injectSpeedInsights();
