import { ReactKeycloakProvider } from '@react-keycloak/web';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import SecurityGuy from './SecurityGuy';
import SecurePage from './SecurePage';
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
					<Route
						path="/"
						element={
							<SecurityGuy>
								<SecurePage />
							</SecurityGuy>
						}
					/>
				</Routes>
			</BrowserRouter>
		</ReactKeycloakProvider>
	);
}
