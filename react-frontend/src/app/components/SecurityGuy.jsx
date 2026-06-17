import { useKeycloak } from '@react-keycloak/web';
// import LandingPage from '../pages/LandingPage';
import { useNavigate } from 'react-router-dom';
// import Login from '../pages/Login';

export default function SecurityGuy({ children }) {
	const { keycloak } = useKeycloak();
	const navigate = useNavigate();

	if (!keycloak.authenticated) {
		return navigate('/');
	}

	return children;
}
