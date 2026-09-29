import { Navigate, Outlet, useLocation } from 'react-router-dom';
import { useKeycloak } from '@react-keycloak/web';

export default function AuthenticatedRoute() {
	const { keycloak } = useKeycloak();
	const location = useLocation();

	if (!keycloak.authenticated) {
		return <Navigate to="/" state={{ from: location }} />;
	}

	return <Outlet />
};
