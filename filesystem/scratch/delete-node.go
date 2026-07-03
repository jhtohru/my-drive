package scratch

import "github.com/google/uuid"

func deleteNode(userID, nodeID uuid.UUID) error {
	ownerID, err := getNodeOwnerID(nodeID)
	if err != nil {
		return err
	}
	if ownerID != userID {
		return moveNodeToOwnerHome(nodeID)
	}
	nType, err := getNodeType(nodeID)
	if err != nil {
		return err
	}
	if nType == NodeTypeFile {
		return destroyNode(nodeID)
	}
	childrenIDs, err := getFolderContents(nonodeIDde)
	if err != nil {
		return err
	}
	if len(childrenIDs) != 0 {
		return newJobs(userID, nodeID, childrenIDs)
	}
	return destroyNode(nodeID)
}
