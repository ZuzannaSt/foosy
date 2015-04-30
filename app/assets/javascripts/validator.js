function setCheckboxes(newMatch) {
  var checkBoxes = newMatch.elements.namedItem("match[player_ids][]");
  var checkedBoxes = 0;

  for( var i = 0; i < (checkBoxes.length -= 1); i++) {
    if ( checkBoxes[i].checked ) {
      checkedBoxes += 1;
    }
  }
  return {
    checkBoxes: checkBoxes,
    checkedBoxes: checkedBoxes
  };
}

function validateCheckboxes(newMatch) {
  var boxes = setCheckboxes(newMatch);

  if ( boxes.checkedBoxes < 2 || boxes.checkedBoxes > 2 ) {
    document.getElementById("matchSubmit").disabled = true;
    for( var j = 0; j < (boxes.checkBoxes.length -= 1); j++) {
        boxes.checkBoxes[j].disabled = false;
    } return false;
  }

  if (boxes.checkedBoxes == 2) {
    document.getElementById("matchSubmit").disabled = false;
    for( var j = 0; j < (boxes.checkBoxes.length -= 1); j++) {
      if ( boxes.checkBoxes[j].checked == false ) {
        boxes.checkBoxes[j].disabled = true;
      }
    }
    return true;
  }
}

function validateForm(newMatch){
  var boxes = setCheckboxes(newMatch);

  if ( boxes.checkedBoxes < 2 || boxes.checkedBoxes > 2 ) {
    bootbox.dialog({
      message: "Remember that you must choose two players to start a game.",
      title: "Ouups!",
      buttons: {
        success: {
          label: "OK, I got it",
          className: "btn-success"
        }
      }
    });
    return false;
  } else {
    return true;
  }
}
