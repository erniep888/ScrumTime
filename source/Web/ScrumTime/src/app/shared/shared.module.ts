import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { LeftNavComponent } from './components/left-nav/left-nav.component';

import { MatButtonModule } from '@angular/material/button';
import { MatDividerModule } from '@angular/material/divider';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';

import { FlexLayoutModule } from '@angular/flex-layout';


@NgModule({
  declarations: [HeaderComponent, FooterComponent, LeftNavComponent],
  imports: [
    CommonModule,
    FlexLayoutModule,
    MatButtonModule,
    MatDividerModule,
    MatIconModule,
    MatToolbarModule
  ],
  exports: [HeaderComponent, FooterComponent, LeftNavComponent ]
})
export class SharedModule { }
