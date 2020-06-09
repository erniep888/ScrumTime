import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DefaultComponent } from './default.component';
import { DashboardComponent } from 'src/app/modules/dashboard/dashboard.component';
import { RouterModule } from '@angular/router';
import { SharedModule } from 'src/app/shared/shared.module';
import { BacklogComponent } from 'src/app/modules/backlog/backlog.component';

import {MatSidenavModule } from '@angular/material/sidenav';



@NgModule({
  declarations: [
    BacklogComponent,
    DashboardComponent,
    DefaultComponent
  ],
  imports: [
    CommonModule,
    MatSidenavModule,
    RouterModule,
    SharedModule
  ]
})
export class DefaultModule { }
