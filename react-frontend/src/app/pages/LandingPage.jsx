import { useEffect } from "react";
import { useNavigate } from "react-router";
import { useAuth } from 'react-oidc-context';
import { FileText } from "lucide-react";
import { Button } from "../components/ui/button";

export default function LandingPage() {
  const auth = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (auth.isAuthenticated) {
      navigate("/documents");
    }
  }, [auth.isAuthenticated, navigate]);

  if (auth.isLoading) {
    return <div>Loading authentication status</div>
  }

  if (auth.error) {
    return <div>Authentication Error: {auth.error.message}</div>;
  }

  const handleSignIn = () => {
    auth.signinRedirect();
  };

  return (
    <div
      className="min-h-screen flex flex-col"
      style={{ fontFamily: "Roboto, sans-serif" }}
    >
      {/* Header */}
      <header className="border-b bg-white px-6 py-4">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <div className="flex items-center gap-2">
            <FileText className="size-8 text-blue-600" />
            <span className="text-2xl font-medium text-gray-900">
              My Docs
            </span>
          </div>
          <Button onClick={handleSignIn}>Sign In</Button>
        </div>
      </header>

      {/* Hero Section */}
      <main className="flex-1 flex items-center justify-center bg-gradient-to-b from-white to-gray-50">
        <div className="max-w-4xl mx-auto px-6 py-20 text-center">
          <div className="mb-8">
            <FileText className="size-24 text-blue-600 mx-auto mb-6" />
            <h1 className="text-5xl font-normal text-gray-900 mb-4">
              Welcome to My Docs
            </h1>
            <p className="text-xl text-gray-600 mb-8">
              Create, edit, and collaborate on documents from
              anywhere. All your documents in one place.
            </p>
          </div>

          <div className="flex gap-4 justify-center">
            <Button
              size="lg"
              onClick={handleSignIn}
              className="px-8"
            >
              Get Started
            </Button>
          </div>

          <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8">
            <div className="p-6">
              <div className="text-4xl mb-4">📝</div>
              <h3 className="text-lg font-medium mb-2">
                Rich Text Editing
              </h3>
              <p className="text-gray-600">
                Create beautiful documents with our powerful
                WYSIWYG editor
              </p>
            </div>
            <div className="p-6">
              <div className="text-4xl mb-4">☁️</div>
              <h3 className="text-lg font-medium mb-2">
                Cloud Storage
              </h3>
              <p className="text-gray-600">
                Access your documents from any device, anywhere
              </p>
            </div>
            <div className="p-6">
              <div className="text-4xl mb-4">🔒</div>
              <h3 className="text-lg font-medium mb-2">
                Secure
              </h3>
              <p className="text-gray-600">
                Your documents are protected with
                enterprise-grade security
              </p>
            </div>
          </div>
        </div>
      </main>

      {/* Footer */}
      <footer className="border-t bg-white px-6 py-4">
        <div className="max-w-7xl mx-auto text-center text-sm text-gray-500">
          © 2026 Docs. All rights reserved.
        </div>
      </footer>
    </div>
  );
}