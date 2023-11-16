#!/bin/bash

# Démarrer Nginx en arrière-plan
nginx -g "daemon off;" &

# Laisser le terminal ouvert
/bin/bash
