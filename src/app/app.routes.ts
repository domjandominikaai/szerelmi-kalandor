import { Routes } from '@angular/router';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { Quizcomponent } from './quizcomponent/quizcomponent';
import { Resultcomponent } from './resultcomponent/resultcomponent';
import { QuizEditorComponent } from './quiz-editor-component/quiz-editor-component';
import { PlayerComponent } from './player-component/player-component';

export const routes: Routes = [
    { path: '', redirectTo: 'quiz', pathMatch: 'full' },
    { path: 'quiz', component: Quizcomponent },
    { path: 'quiz-editor', component: QuizEditorComponent },
    { path: 'play-quiz/:code', component: PlayerComponent },
    { path: 'results', component: Resultcomponent },
    { path: '**', redirectTo: 'quiz' }
];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
