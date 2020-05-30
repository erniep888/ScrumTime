import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { WorkItemRoutingModule } from './work-item-routing.module';
import { WorkItemComponent } from './work-item.component';
import { HttpClientModule } from '@angular/common/http';


@NgModule({
  declarations: [WorkItemComponent],
  imports: [
    CommonModule,
    WorkItemRoutingModule,
    HttpClientModule
  ]
})
export class WorkItemModule { }
