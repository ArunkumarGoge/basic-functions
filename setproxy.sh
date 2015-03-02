#!/bin/bash

echo Acquire::http::Proxy \"http://172.16.1.35:808\/\"\; > /etc/apt/apt.conf
echo Acquire::https::Proxy \"https://172.16.1.35:808\/\"\; >> /etc/apt/apt.conf
