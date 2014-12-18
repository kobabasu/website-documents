#!/bin/sh
set -e

rm -fr jedie/_layouts/*
rm -fr jedie/_posts/*
find jedie -type f \( -name 'README.md' -o -name '_config.yml' -o -name 'rss.xml' \) -prune -o -type f -print | xargs rm -f

rm -fr public/developers/*
rm -fr public/documents/*
rm -fr public/logs/*
rm -fr public/meeting/*
rm -fr public/template/*
rm -fr public/templates/*
rm -fr public/update/*

find public -type d \( -name 'assets' \
  -o -name 'coverage'   \
  -o -name 'developers' \
  -o -name 'doc'        \
  -o -name 'documents'  \
  -o -name 'error'      \
  -o -name 'js'         \
  -o -name 'logs'       \
  -o -name 'meeting'    \
  -o -name 'templates'  \
  -o -name 'test'       \
  -o -name 'update'     \
  \) -prune -o -type f \( -name ',htaccess' \
  -o -name 'README.html'     \
  -o -name 'developers.html' \
  -o -name 'documents.html'  \
  -o -name 'index.html'      \
  -o -name 'links.html'      \
  -o -name 'logs.html'       \
  -o -name 'robots.txt'      \
  -o -name 'rss.xml'         \
  -o -name 'sitemap.xml'     \
  -o -name 'vendor'          \
  \) -prune -o -type f -print | xargs rm -fr
