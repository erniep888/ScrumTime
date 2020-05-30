import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { WorkItemComponent } from './work-item.component';

const routes: Routes = [{ path: '', component: WorkItemComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class WorkItemRoutingModule { }
