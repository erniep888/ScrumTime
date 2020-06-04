import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [   
  { 
    path: '', 
    loadChildren: () => 
      import('./scrum-time-app/scrum-time-app.module')
      .then(m => m.ScrumTimeAppModule) 
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
