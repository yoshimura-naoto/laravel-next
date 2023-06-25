<?php

use App\Models\Sample;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/sample', function () {
    $samples = Sample::all();
    $array = $samples->map(function ($sample) {
            return [
                'id' => $sample->id,
                'text' => $sample->text,
            ];
        })
        ->toArray();
    return response()->json($array);
});

Route::post('/sample', function (Request $request) {
    $request->validate(['text' => ['required', 'string']]);
    $sample = Sample::query()
        ->create(['text' => $request->input('text')]);
    return response()->json([
        'id' => $sample->id,
        'text' => $sample->text,
    ]);
});
