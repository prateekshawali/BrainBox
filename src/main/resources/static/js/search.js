/**
 * Search functionality for BrainBox application
 * This script provides client-side search functionality for tables in the application
 */

/**
 * Performs a search on a table based on input value
 * @param {string} inputId - ID of the search input field
 * @param {string} tableId - ID of the table to search
 * @param {Array<number>} columns - Array of column indices to search in (0-based)
 */
function searchTable(inputId, tableId, columns) {
    // Get input value
    const input = document.getElementById(inputId);
    const filter = input.value.toLowerCase();
    
    // Get table and rows
    const table = document.getElementById(tableId);
    const rows = table.getElementsByTagName("tr");
    
    // Counter for matches
    let matchCount = 0;
    
    // Loop through rows, starting from index 1 to skip the header row
    for (let i = 1; i < rows.length; i++) {
        const row = rows[i];
        let shouldDisplay = false;
        
        // Skip rows that don't have enough columns or are separators
        const cells = row.getElementsByTagName("td");
        if (!cells || cells.length === 0) continue;
        
        // If this row has a colspan (often used for "no items" messages),
        // display it only when the filter is empty
        if (cells[0].hasAttribute("colspan") && cells.length === 1) {
            row.style.display = filter === "" ? "" : "none";
            continue;
        }
        
        // Loop through specified columns in this row
        for (let j = 0; j < columns.length; j++) {
            const columnIndex = columns[j];
            
            // Skip if column index is out of bounds
            if (columnIndex >= cells.length) continue;
            
            const cell = cells[columnIndex];
            
            // Check if cell exists and has text content
            if (cell) {
                const text = cell.textContent || cell.innerText;
                
                // If search text is found in this cell, show the row
                if (text.toLowerCase().indexOf(filter) > -1) {
                    shouldDisplay = true;
                    break;
                }
            }
        }
        
        // Set display style based on search match
        if (shouldDisplay) {
            row.style.display = "";
            matchCount++;
        } else {
            row.style.display = "none";
        }
    }
    
    // Show or hide "no results" message
    const noResultsMsg = document.getElementById(tableId + "NoResults");
    if (noResultsMsg) {
        noResultsMsg.style.display = matchCount === 0 ? "block" : "none";
    }
}

/**
 * Clears the search input and resets the table display
 * @param {string} inputId - ID of the search input field
 * @param {string} tableId - ID of the table to reset
 */
function clearSearch(inputId, tableId) {
    // Clear the input
    const input = document.getElementById(inputId);
    input.value = "";
    
    // Reset the table
    const table = document.getElementById(tableId);
    const rows = table.getElementsByTagName("tr");
    
    // Show all rows
    for (let i = 1; i < rows.length; i++) {
        rows[i].style.display = "";
    }
    
    // Hide "no results" message
    const noResultsMsg = document.getElementById(tableId + "NoResults");
    if (noResultsMsg) {
        noResultsMsg.style.display = "none";
    }
}
