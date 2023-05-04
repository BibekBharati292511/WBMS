window.addEventListener("load", function () {
  // Get the button element using its ID
  const issue = document.getElementById("issue");

  // Add an onclick event listener to the button
  issue.onclick = function () {
    // Your code here
    // Remove any existing form
    $("#editModal").remove();
    // Create a form with the current values
    const formHTML = `
        <form method="post" action="addbill.php">
        <input type="hidden" name="owners_id" value="<?php echo $id; ?>" />
        <input type="hidden" name="date" value="<?php echo $date; ?>" />

        <label for="prev">Previous Reading:</label>
        <input type="text" name="prev" id="prev" value="<?php echo $previous; ?>" />

        <label for="pres">Present Reading:</label>
        <input type="text" name="pres" id="pres" />

        <label for="price">Price/ml:</label>
        <input type="text" name="price" id="price" value="10" />
      </form>

        `;
    const modalHTML = `
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Issue Bill</h5>
              </div>
              <div class="modal-body">
                ${formHTML}
              </div>
              <div class="modal-footer">
                <button type="button" class="bttn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="bttn btn-primary" id="issueButton">Issue</button>
              </div>
            </div>
          </div>
        </div>
      `;

    // Append the modal HTML to the body
    $("body").append(modalHTML);
    // Show the modal
    $("#editModal").modal("show");
  };
});

