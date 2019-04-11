# Domain Inspect
A small tool that wraps around the `whois` and the `dig` command.

To run this tool you need both packagse to be installed.

## Features
- Outputs relevent whois information on that domain, such as owner, registrar info and dates
- Outputs nameservers configured for domain, getting info from WHOIS as well as from DNS directly
- Checks if DNS `A` record(s) exists for the TLD.

## Install
- Install whois and dig package, for example: `apt-get install whois dig`
- Clone repo or just download the domain-inspect.sh file
- Make sure `domain-inspect.sh` is executable, if in doubt to a `chmod +x domain-inspect.sh`

## Usage

Provide exactly one top level domain name (`domainname.tld`) as argument.

Example:

`./domain-inspect.sh google.com`

That's it, no more other features.

## Licence
As is license, no guarantees or licencing attached. Just a simple wrapper script.
