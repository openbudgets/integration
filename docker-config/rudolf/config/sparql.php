<?php
/**
 * Created by PhpStorm.
 * User: larjohns
 * Date: 26/02/2016
 * Time: 20:12:49
 */


return [
    "prefixes"=>[
        'rdfs' => 'http://www.w3.org/2000/01/rdf-schema#',
        'qb' => 'http://purl.org/linked-data/cube#',
        'skos'=>'http://www.w3.org/2004/02/skos/core#',
        'rdf' => 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
        'xro' => 'http://purl.org/xro/ns#',
    ],
    "excusedPrefixes" => [
        'bif' => 'http://www.openlinksw.com/schemas/bif#'
    ],
    "endpoint" =>'http://virtuoso_staging:8890/sparql',
    "virtuoso" => true,
    "languagesOrder" => [
       "en", "de", "fr", "el", "es", "cs"
    ],
    "defaultAuthor" => "OpenBudgets.eu <info@openbudgets.eu>",
    "defaultCountryCode" => "EU"


];
