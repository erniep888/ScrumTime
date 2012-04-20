package scrumtime

import javax.annotation.PostConstruct
import commands.ArtifactUploadCommand

class ArtifactService  {
    HashMap<String, String> subfolderDictionary
    String rootFolder

    @PostConstruct
    def initialize() {
        rootFolder = File.separator + "artifacts"
        subfolderDictionary = new HashMap<String, String>()
        def folderNames = new Vector<String>()
        folderNames.add("product")
        folderNames.add("release")
        folderNames.add("iteration")
        folderNames.add("feature")
        folderNames.add("story")
        folderNames.add("bug")
        folderNames.add("task")
        folderNames.add("team")
        folderNames.add("actor")
        folderNames.add("dailymeeting")
        for(def folderName in folderNames){
            subfolderDictionary.put(folderName, rootFolder + File.separator + folderName)
        }

        def rootFolderDir = new File(rootFolder)
        if (!rootFolderDir.exists()) {  // the root folder does not exist
            rootFolderDir.mkdir()
            for(def directory in subfolderDictionary.values()){
                def subFolderDir = new File(directory)
                if (!subFolderDir.exists())  // the sub folder does not exist
                    subFolderDir.mkdir()
            }
        }
    }

    def save(Artifact artifact, String targetFolderName,byte[] bytes, def artifactContainerModel){
        artifact.serverFilePath = subfolderDictionary[targetFolderName]
        artifact.serverFileName = UUID.randomUUID().toString();
        def fullPathAndFileName = artifact.serverFilePath + File.separator + artifact.serverFileName
        def fileOutputStream = new FileOutputStream(fullPathAndFileName)
        fileOutputStream.write(bytes)
        fileOutputStream.close()
        artifactContainerModel.addToArtifacts(artifact)
        artifact.save()
        artifactContainerModel.save()
    }
}
