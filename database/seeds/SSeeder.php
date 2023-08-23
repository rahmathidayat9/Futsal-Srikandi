<?php

use Illuminate\Database\Seeder;

class SSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            UserSeeder::class,
            OperatorSeeder::class,
            JadwalSeeder::class,
            LapanganSeeder::class,
            TransaksiSeeder::class,
        ]);
    }
}
