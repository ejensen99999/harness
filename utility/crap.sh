#!/usr/bin/env bash

cat <<EOF > nuget.config
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <packageSources>
        <add key="NuGet official package source" value="https://api.nuget.org/v3/index.json" />
    </packageSources>
</configuration>
EOF
