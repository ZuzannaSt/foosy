function validateCheckboxes(newMatch) {
  var checkBoxes = newMatch.elements.namedItem("match[player_ids][]");
  var checkedBoxes = 0;

  for( var i = 0; i < (checkBoxes.length -= 1); i++) {
    if ( checkBoxes[i].checked ) {
      checkedBoxes += 1;
    }
  }

  if ( checkedBoxes < 2 || checkedBoxes > 2 ) {
    document.getElementById("matchSubmit").disabled = true;
    for( var j = 0; j < (checkBoxes.length -= 1); j++) {
        checkBoxes[j].disabled = false;
    }

    bootbox.dialog({
      message: "You must choose two players to start a game.",
      title: "Holy Guacamole!",
      buttons: {
        success: {
          label: "OK, I got it",
          className: "btn-success"
        }
      }
    });

    return false;
  }
  else {
    document.getElementById("matchSubmit").disabled = false;
    for( var j = 0; j < (checkBoxes.length -= 1); j++) {
      if ( checkBoxes[j].checked == false ) {
        checkBoxes[j].disabled = true;
      }
    }
    return true;
  }
}
