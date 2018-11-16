# Lessons

Using this with [Symfony DomCrawler](https://symfony.com/doc/current/components/dom_crawler.html).

## Append new element

```php
<?php
use Symfony\Component\DomCrawler\Crawler as DomCrawler;

$html = ....;
$doc = new \DOMDocument;
$doc->loadHtml($html);
$crawler = new DomCrawler($doc);
$row_nodes = $crawler->filter('.rows');
// loop through each .row
foreach ($row_nodes as $node) {
    $div_col = $doc->createElement('div');
    $div_col->setAttribute('class', 'col-md-12');
    $div_col->textContent = 'This is the inner html content';
    $node->appendChild($div_col);
}

echo $crawler->html();
```

Reference: [how to add a xml node to a symfony Crawler()](https://stackoverflow.com/questions/40862303/how-to-add-a-xml-node-to-a-symfony-crawler/48310668#48310668)
