clc;
clear;
TEST = imread ('Trainset\TestSample\img_213.jpg');
[featureVectorT]=extractHOGFeatures(TEST);
FV = featureVectorT;

myFolder = 'Trainset\0s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\1s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\2s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray);
  FV = [FV;featureVector];
end
myFolder = 'Trainset\3s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\4s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\5s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray);
  FV = [FV;featureVector];
end
myFolder = 'Trainset\6s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\7s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\8s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
myFolder = 'Trainset\9s';
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);


for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
  [featureVector] = extractHOGFeatures( imageArray );
  FV = [FV;featureVector];
end
DFV = FV;
for m=2:1:101
DFV(m-1,:) = abs(FV(m,:)-FV(1,:));
end
votes = zeros(1,101);
votesforhist=zeros(1,10);

for i=1:1:144
    [~, idx] = min(DFV(:,i));
    votes(idx)= votes(idx)+1;
    votesforhist(i)=idx;
end
for i=1:10
votesForClasses(i)=sum(votes((i-1)*10+1 : i*10));
end
  [val, idx] = max(votesForClasses);
disp(idx-1)
figure
subplot(1,2,1),hist(votesforhist);
title('Similarity Histogram of testpicture ');
xlabel('Training set 0s for 0-10 1s for 10-20');
ylabel('Similarity Level');
subplot(1,2,2),imshow(TEST);


