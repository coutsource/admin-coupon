<?php

namespace App\Admin\Extensions;

use Encore\Admin\Grid\Exporters\AbstractExporter;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\Model;
            

class CsvExpoter extends AbstractExporter
{
    /**
     * {@inheritdoc}
     */
    public function export()
    {
        $filename = $this->getTable().'.csv';

        $headers = [
            'Content-Encoding'    => 'UTF-8',
            'Content-Type'        => 'text/csv;charset=UTF-8',
            'Content-Disposition' => "attachment; filename=\"$filename\"",
        ];



        response()->stream(function () {
            $handle = fopen('php://output', 'w');
            $columns = $this->columns();
            $keys = array_keys($columns);
            $titles = array_values($columns);
            fputcsv($handle, $titles);
            $this->chunk(function ($records) use ($handle, $keys) {
                foreach ($records as $record) {
                    fputcsv($handle, array_only($record->getAttributes(), $keys));
                }
            });
        }, 200, $headers)->send();

        // Close the output stream
        exit;
    }

    public function columns()
    {
        $eloquent = $this->grid->model()->eloquent();

        return $eloquent->getExportColumns();
    }
}
