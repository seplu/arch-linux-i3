#!/bin/bash

printf "" && df -h /home | awk '/[0-9]%/{print $(NF-2)}'
