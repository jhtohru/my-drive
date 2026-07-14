import { Outlet } from 'react-router-dom';
import { withAuthenticationRequired } from 'react-oidc-context';

export const SecuredRoute = withAuthenticationRequired(Outlet, {
	OnRedirecting: () => <div>Redirecting to login...</div>,
});
