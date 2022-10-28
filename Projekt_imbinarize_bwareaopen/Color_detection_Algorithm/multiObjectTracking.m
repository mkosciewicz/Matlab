function multiObjectTracking()
cam = ipcam('http://192.168.0.225:8080/video');
% Create System objects used for reading video, detecting moving objects,
% and displaying the results.
obj = setupSystemObjects();

tracks = initializeTracks(); % Create an empty array of tracks.

nextId = 1; % ID of the next track

% Detect moving objects, and track them across video frames.
%~isDone(obj.reader)
while (1)
    frame = readFrame();
    [~, ~, ~] = detectObjects(frame);
    predictNewLocationsOfTracks();
    [~, ~, ~] = ...
        detectionToTrackAssignment();
    
    updateAssignedTracks();
    updateUnassignedTracks();
    deleteLostTracks();
    createNewTracks();
    
    displayTrackingResults();
end