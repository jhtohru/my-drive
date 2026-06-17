import { ReactKeycloakProvider } from '@react-keycloak/web';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import AuthenticatedRoute from './components/auth/AuthenticatedRoute';
import LandingPage from './pages/LandingPage';
import DocumentsList from './pages/DocumentsList';
import DocumentViewer from './pages/DocumentViewer';
import DocumentEditor from './pages/DocumentEditor';
import Keycloak from 'keycloak-js';

const keycloak = new Keycloak({
	url: 'http://localhost:8181',
	realm: 'master',
	clientId: 'react-frontend',
});

export default function App() {
	return (
		<ReactKeycloakProvider authClient={keycloak}>
			<BrowserRouter>
				<Routes>
					<Route path="/" element={<LandingPage />}/>
					<Route element={<AuthenticatedRoute />}>
						<Route path="/documents" element={<DocumentsList/>} />
            <Route path="/documents/:id/view" element={<DocumentViewer/>}/>
            <Route path="/documents/:id/edit" element={<DocumentEditor/>}/>
					</Route>
				</Routes>
			</BrowserRouter>
		</ReactKeycloakProvider>
	);
}
