add_lunch_combo tmobile_generic_pluto-eng
add_lunch_combo tmobile_dream_pluto-eng
add_lunch_combo tmobile_zoom2_pluto-eng
add_lunch_combo tmobile_sancho_pluto-eng
add_lunch_combo tmobile_sapphire_pluto-eng
add_lunch_combo tmobile_dream_pluto-user

function sync() {
	adb shell stop && \
	  adb sync && \
	  adb shell start
}

# Utility script to make sure all projects are checked out to the correctly
# named local branch according to the manifest.
function branchclean() {
	repo forall -c '(git checkout ${REPO_RREV##*/} 1>/dev/null 2>&1 || git checkout -b ${REPO_RREV##*/} ${REPO_REMOTE}/${REPO_RREV##*/} 1>/dev/null 2>&1) || echo "Failed to switch $REPO_PATH to ${REPO_REMOTE}/${REPO_RREV##*/}"'
}

function branchswitch() {
	repo init -b $1 && \
	  branchclean && \
	  repo sync
}
