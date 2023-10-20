#!/bin/bash

# Check if the Datadog agent is running
if systemctl is-active datadog-agent.service &> /dev/null; then
    echo "Datadog agent is installed and running."
else
    echo "Datadog agent is not running. Installing..."

    # Prompt the user to enter the Datadog API key
    read -p "Enter your Datadog API key: " DD_API_KEY

    # Set the Datadog configuration with the provided API key and run the installation command
    DD_SITE="us5.datadoghq.com" DD_APM_INSTRUMENTATION_ENABLED=host DD_API_KEY="$DD_API_KEY" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"

    echo "Datadog agent installation completed."
fi
