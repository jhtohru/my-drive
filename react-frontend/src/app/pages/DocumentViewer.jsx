import { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router";
import { Button } from "../components/ui/button";
import useDocumentsApi from '../utils/documents';
import { ArrowLeft, Edit } from "lucide-react";
import "react-quill/dist/quill.snow.css";

export default function DocumentViewer() {
  const { getDocument } = useDocumentsApi();
  const navigate = useNavigate();
  const { id } = useParams();
  const [document, setDocument] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getDocument(id)
      .then(setDocument)
      .then(() => { setLoading(false); });
  }, [getDocument, id]);

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-gray-600">Loading...</div>
      </div>
    );
  }

  if (!document) {
    return null;
  }

  return (
    <div className="min-h-screen bg-gray-50" style={{ fontFamily: 'Roboto, sans-serif' }}>
      {/* Header */}
      <header className="bg-white border-b sticky top-0 z-10">
        <div className="px-6 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4">
              <Button
                variant="ghost"
                size="sm"
                onClick={() => navigate("/documents")}
              >
                <ArrowLeft className="size-4 mr-2" />
                Back
              </Button>
              <h1 className="text-lg font-medium">{document.title}</h1>
            </div>
            <Button
              size="sm"
              onClick={() => navigate(`/documents/${id}/edit`)}
            >
              <Edit className="size-4 mr-2" />
              Edit
            </Button>
          </div>
        </div>
      </header>

      {/* Document Content */}
      <main className="p-6">
        <div className="max-w-4xl mx-auto bg-white rounded-lg shadow-sm border p-12">
          <h1 className="text-4xl font-normal mb-6 text-gray-900">
            {document.title}
          </h1>
          <div className="text-sm text-gray-500 mb-8">
            Last updated: {new Date(document.updatedAt).toLocaleString()}
          </div>
          <div
            className="ql-editor prose max-w-none"
            dangerouslySetInnerHTML={{ __html: document.content }}
            style={{
              padding: 0,
              minHeight: '400px',
            }}
          />
        </div>
      </main>
    </div>
  );
}
