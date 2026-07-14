import { AuthProvider } from 'react-oidc-context';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { SecuredRoute } from './components/auth/SecuredRoute';
import LandingPage from './pages/LandingPage';
import DocumentsList from './pages/DocumentsList';
import DocumentViewer from './pages/DocumentViewer';
import DocumentEditor from './pages/DocumentEditor';

const oidcConfig = {
  authority: 'http://localhost:8000',
  client_id: 'f3f23d070d9db967220e',
  redirect_uri: window.location.origin,
  post_logout_redirect_uri: window.location.origin,
  onSigninCallback: () => {
    window.history.replaceState(
      {},
      document.title,
      window.location.pathname,
    );
  },
};

export default function App() {
  return (
    <AuthProvider {...oidcConfig}>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<LandingPage />} />
          <Route element={<SecuredRoute />}>
            <Route path="/documents" element={<DocumentsList/>} />
            <Route path="/documents/:id/view" element={<DocumentViewer/>} />
            <Route path="/documents/:id/edit" element={<DocumentEditor/>} />
          </Route>
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
}
