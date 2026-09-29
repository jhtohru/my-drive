import { useCallback, useState, useEffect } from "react";
import { useNavigate } from "react-router";
import { useKeycloak } from '@react-keycloak/web';
import { Button } from "../components/ui/button";
import { Input } from "../components/ui/input";
import useDocumentsApi from '../utils/documents';

import {
  FileText,
  Plus,
  Eye,
  Edit,
  Trash2,
  LogOut,
  Search,
} from "lucide-react";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "../components/ui/alert-dialog";

export default function DocumentsList() {
  const { createDocument, deleteDocument, listDocuments } = useDocumentsApi();
  const { keycloak } = useKeycloak();
  const navigate = useNavigate();
  const [documents, setDocuments] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [deleteId, setDeleteId] = useState(null);

  const loadDocuments = useCallback(() => {
    listDocuments()
      .then(setDocuments);
  }, [listDocuments]); 

  useEffect(() => {
    loadDocuments();
  }, [loadDocuments]);

  const handleCreateDocument = async () => {
    const doc = await createDocument('Untitled Document', '');
    navigate(`/documents/${doc.id}/edit`);
  };

  const handleDeleteDocument = async (id) => {
    await deleteDocument(id);
    await loadDocuments();
    setDeleteId(null);
  };

  const handleLogout = () => { keycloak.logout(); };

  const filteredDocuments = documents.filter((doc) =>
    doc.title.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <div className="min-h-screen bg-gray-50" style={{ fontFamily: 'Roboto, sans-serif' }}>
      {/* Header */}
      <header className="bg-white border-b sticky top-0 z-10">
        <div className="max-w-7xl mx-auto px-6 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <FileText className="size-8 text-blue-600" />
              <span className="text-2xl font-medium text-gray-900">My Docs</span>
            </div>
            <div className="flex items-center gap-4">
              <span className="text-sm text-gray-600">
                Welcome, {/*TODO: place user name here*/}
              </span>
              <Button variant="outline" size="sm" onClick={handleLogout}>
                <LogOut className="size-4 mr-2" />
                Sign Out
              </Button>
            </div>
          </div>
        </div>
      </header>

      <div className="max-w-7xl mx-auto px-6 py-8">
        {/* Action Bar */}
        <div className="mb-8 flex items-center justify-between">
          <h1 className="text-3xl font-normal text-gray-900">My Documents</h1>
          <Button onClick={handleCreateDocument}>
            <Plus className="size-4 mr-2" />
            New Document
          </Button>
        </div>

        {/* Search */}
        <div className="mb-6 relative">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 size-4 text-gray-400" />
          <Input
            type="text"
            placeholder="Search documents..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            className="pl-10 max-w-md"
          />
        </div>

        {/* Documents Grid */}
        {filteredDocuments.length === 0 ? (
          <div className="text-center py-20">
            <FileText className="size-16 text-gray-300 mx-auto mb-4" />
            <h2 className="text-xl text-gray-600 mb-2">
              {searchQuery ? "No documents found" : "No documents yet"}
            </h2>
            <p className="text-gray-500 mb-6">
              {searchQuery
                ? "Try a different search term"
                : "Create your first document to get started"}
            </p>
            {!searchQuery && (
              <Button onClick={handleCreateDocument}>
                <Plus className="size-4 mr-2" />
                Create Document
              </Button>
            )}
          </div>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {filteredDocuments.map((doc) => (
              <div
                key={doc.id}
                className="bg-white rounded-lg border border-gray-200 hover:shadow-lg transition-shadow p-6"
              >
                <div className="flex items-start gap-3 mb-4">
                  <FileText className="size-6 text-blue-600 flex-shrink-0 mt-1" />
                  <div className="flex-1 min-w-0">
                    <h3 className="font-medium text-gray-900 truncate mb-1">
                      {doc.title}
                    </h3>
                    <p className="text-sm text-gray-500">
                      Updated {new Date(doc.updatedAt).toLocaleDateString()}
                    </p>
                  </div>
                </div>

                <div className="flex gap-2">
                  <Button
                    size="sm"
                    variant="outline"
                    onClick={() => navigate(`/documents/${doc.id}/view`)}
                    className="flex-1"
                  >
                    <Eye className="size-4 mr-1" />
                    View
                  </Button>
                  <Button
                    size="sm"
                    onClick={() => navigate(`/documents/${doc.id}/edit`)}
                    className="flex-1"
                  >
                    <Edit className="size-4 mr-1" />
                    Edit
                  </Button>
                  <Button
                    size="sm"
                    variant="outline"
                    onClick={() => setDeleteId(doc.id)}
                  >
                    <Trash2 className="size-4 text-red-600" />
                  </Button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Delete Confirmation Dialog */}
      <AlertDialog open={deleteId !== null} onOpenChange={() => setDeleteId(null)}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>Delete Document</AlertDialogTitle>
            <AlertDialogDescription>
              Are you sure you want to delete this document? This action cannot be undone.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancel</AlertDialogCancel>
            <AlertDialogAction
              onClick={() => deleteId && handleDeleteDocument(deleteId)}
              className="bg-red-600 hover:bg-red-700"
            >
              Delete
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}
