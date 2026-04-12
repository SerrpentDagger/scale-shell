#!/bin/bash

ERROR_HANDLING=0

catch_errors() {
	if ((ERROR_HANDLING == 1)); then
		return
	else
		ERROR_HANDLING=1
	fi

	local exit_code=$?

	echo "ERROR: Command exit with non-zero return $exit_code."
	echo "Installation stopped! Please consider the above log."
	echo "You can attempt to continue installation by running the following:"
	echo "  bash $HOME/.local/share/feathers-and-flame/install.sh"
}

# Exit handler - ensures cleanup happens on any exit
exit_handler() {
	local exit_code=$?

	# Only run if we're exiting with an error and haven't already handled it
	if ((exit_code != 0)) && ((ERROR_HANDLING == 0)); then
		catch_errors
	fi
}

# Set up traps
trap catch_errors ERR INT TERM
trap exit_handler EXIT
