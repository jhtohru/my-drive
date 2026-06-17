import { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router";
import { Button } from "../components/ui/button";
import { Input } from "../components/ui/input";
import useDocumentsApi from '../utils/documents';
import { ArrowLeft, Save, Eye } from "lucide-react";
import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";

export default function DocumentEditor() {
  const { getDocument, updateDocument } = useDocumentsApi();
  const navigate = useNavigate();
  const { id } = useParams();
  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");
  const [saved, setSaved] = useState(true);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getDocument(id)
      .then((doc) => {
        setTitle(doc.title);
        setContent(doc.content);
      })
      .then(() => { setLoading(false); });
  }, [getDocument, id]);

  const handleSave = () => {
    if (id) {
      updateDocument(id, title, content);
      setSaved(true);
    }
  };

  const handleTitleChange = (value) => {
    setTitle(value);
    setSaved(false);
  };

  const handleContentChange = (value) => {
    setContent(value);
    setSaved(false);
  };

  const modules = {
    toolbar: [
      [{ header: [1, 2, 3, 4, 5, 6, false] }],
      [{ font: [] }],
      [{ size: [] }],
      ["bold", "italic", "underline", "strike"],
      [{ color: [] }, { background: [] }],
      [{ script: "sub" }, { script: "super" }],
      ["blockquote", "code-block"],
      [{ list: "ordered" }, { list: "bullet" }],
      [{ indent: "-1" }, { indent: "+1" }],
      [{ align: [] }],
      ["link", "image", "video"],
      ["clean"],
    ],
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="text-gray-600">Loading...</div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50 flex flex-col" style={{ fontFamily: 'Roboto, sans-serif' }}>
      {/* Header */}
      <header className="bg-white border-b sticky top-0 z-10">
        <div className="px-6 py-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-4 flex-1">
              <Button
                variant="ghost"
                size="sm"
                onClick={() => navigate("/documents")}
              >
                <ArrowLeft className="size-4 mr-2" />
                Back
              </Button>
              <Input
                type="text"
                value={title}
                onChange={(e) => handleTitleChange(e.target.value)}
                placeholder="Untitled Document"
                className="max-w-md text-lg border-0 focus-visible:ring-0 px-2"
              />
              {!saved && (
                <span className="text-sm text-gray-500">Not saved</span>
              )}
            </div>
            <div className="flex items-center gap-2">
              <Button
                variant="outline"
                size="sm"
                onClick={() => navigate(`/documents/${id}/view`)}
              >
                <Eye className="size-4 mr-2" />
                Preview
              </Button>
              <Button size="sm" onClick={handleSave} disabled={saved}>
                <Save className="size-4 mr-2" />
                {saved ? "Saved" : "Save"}
              </Button>
            </div>
          </div>
        </div>
      </header>

      {/* Editor */}
      <main className="flex-1 p-6">
        <div className="max-w-5xl mx-auto bg-white rounded-lg shadow-sm border min-h-[calc(100vh-200px)]">
          <ReactQuill
            theme="snow"
            value={content}
            onChange={handleContentChange}
            modules={modules}
            placeholder="Start writing your document..."
            className="h-full"
            style={{ height: 'calc(100vh - 250px)' }}
          />
        </div>
      </main>
    </div>
  );
}
