#!/bin/bash
# Needs whois and dig to be installed

DOMAIN=$1
DOMAIN_REGEX="^([a-z0-9-]+\.[a-z]+)$"

if [ -z "$DOMAIN" ]; then
  echo 'Usage: ./domain-inspect.sh somedomain.com'
  exit 1
fi

if [[ ! "$DOMAIN" =~ $DOMAIN_REGEX ]]; then
  echo 'Invalid domain pattern, only TLDs allowed'
  exit 2
fi

whois_infos=$(whois -h geektools.com $DOMAIN)

echo 'Output general WHOIS infos'
echo '---------------------------------'

echo "$whois_infos" | grep 'Organization:' | sort
echo "$whois_infos" | grep -E 'Date:|Changed:' | sort
echo "$whois_infos" | grep 'Registrar:'
echo "$whois_infos" | grep 'Registrar URL:'

echo ''

echo 'Output Nameservers from WHOIS'
echo '---------------------------------'
echo "$whois_infos" | grep -E "Name Server|Nameserver|Nserver" | awk -F' ' '{print tolower($NF)}' | sort

echo ''

echo 'Output Nameservers from DNS (dig)'
echo '----------------------------------'
dig NS $DOMAIN +short

echo ''

echo 'Check for A record(s) on domain (TLD)'
echo '----------------------------------'
dig A $DOMAIN +short
