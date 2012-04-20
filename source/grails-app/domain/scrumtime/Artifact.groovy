package scrumtime

class Artifact implements Comparable<Artifact> {
    String description
    String fileName
    String serverFilePath
    String serverFileName
    String contentType
    Long size

    static constraints = {
        description(nullable: true)
        fileName(nullable:  false, blank: false)
        serverFilePath(nullable:  false, blank: false)
        serverFileName(nullable: false, blank:  false)
        contentType(nullable:  false, blank: false)
        size(nullable: false)
    }

    @Override
    int compareTo(Artifact artifactComparison) {
        int result = 0
        if (artifactComparison != null){
            if (this.fileName != artifactComparison.fileName){
                result = this.fileName.compareTo(artifactComparison.fileName)
            }
            else if (this.serverFileName != artifactComparison.serverFileName){
                result = this.serverFileName.compareTo(artifactComparison.serverFileName)
            }
            else if (this.serverFilePath != artifactComparison.serverFilePath){
                result = this.serverFilePath.compareTo(artifactComparison.serverFilePath)
            }
            else if (this.contentType != artifactComparison.contentType){
                result = this.contentType.compareTo(artifactComparison.contentType)
            }
            else if (this.size != artifactComparison.size){
                result = this.size.compareTo(artifactComparison.size)
            }
            else if (this.description != artifactComparison.description){
                result = this.description.compareTo(artifactComparison.description)
            }
        }
        result
    }
}
