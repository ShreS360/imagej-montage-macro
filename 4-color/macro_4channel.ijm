// Prompt for parent folder
parentDir = getDirectory("Choose parent directory with image folders");

// Recursively process all .tif/.tiff images
processFolder(parentDir);

function processFolder(folderPath) {
    list = getFileList(folderPath);
    for (i = 0; i < list.length; i++) {
        itemPath = folderPath + list[i];
        if (File.isDirectory(itemPath)) {
            processFolder(itemPath); // Recurse into subfolder
        } else if (endsWith(list[i], ".tif") || endsWith(list[i], ".tiff")) {
            open(itemPath);
            processImage(itemPath);
        }
    }
}

function processImage(fullPath) {
    inputTitle = getTitle();

    // Split channels
    run("Split Channels");

    // Construct channel names
    c1 = "C1-" + inputTitle;
    c2 = "C2-" + inputTitle;
    c3 = "C3-" + inputTitle;
    c4 = "C4-" + inputTitle;

    // Merge into RGB: assign C3 to red (c1), C2 to green (c2), C1 to blue (c3)
    run("Merge Channels...", "c1=[" + c3 + "] c2=[" + c2 + "] c3=[" + c1 + "] c5=[" + c4 + "] create keep");
    run("RGB Color");

    // Close original image
    //selectImage(inputTitle);
    //close();

    // Stack channels
    run("Images to Stack", "use");

    // Get original image folder and file name base
    slash = lastIndexOf(fullPath, "/");
    folder = substring(fullPath, 0, slash + 1);
    filename = substring(fullPath, slash + 1);
    baseName = replace(replace(filename, ".tiff", ""), ".tif", "");

    // Use known name of saved stack
    stackTitle = baseName + "_Stack.tif";

    // Save outputs to same folder
    saveAs("Tiff", folder + stackTitle);
    run("Make Montage...", "columns=5 rows=1 scale=1");
    saveAs("Tiff", folder + baseName + "_Montage.tif");

    // Close images
    close(); // montage
    closeImageIfOpen(stackTitle);
    closeImageIfOpen("Composite");

    // Close split channels if still open
    closeImageIfOpen(c1);
    closeImageIfOpen(c2);
    closeImageIfOpen(c3);
    closeImageIfOpen(c4);
}

function closeImageIfOpen(title) {
    if (isOpen(title)) {
        selectImage(title);
        close();
    }
}
