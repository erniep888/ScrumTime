import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ScrumTimeHomeComponent } from './components/scrum-time-home/scrum-time-home.component';

const routes: Routes = [{ 
  path: '', 
  component: ScrumTimeHomeComponent, 
  children: [
    {
      path: 'backlog',
      loadChildren: () =>
        import('../work-item/work-item.module')
          .then(m => m.WorkItemModule),
    }
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ScrumTimeAppRoutingModule { }
