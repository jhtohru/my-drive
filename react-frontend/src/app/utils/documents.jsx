import { useCallback } from 'react';
import { useKeycloak } from '@react-keycloak/web';

const BASE_URI = 'http://localhost:8000';

const parseDocument = (data) => ({
  ...data,
  createdAt: data.created_at,
  updatedAt: data.updated_at,
  created_at: undefined,
  updated_at: undefined,
});

export default function useDocumentsApi() {
  const { keycloak } = useKeycloak();

  const fetchApi = useCallback(async (path, { body, ...customConfig} = {}) => {
    const config = {
      method: body ? 'POST' : 'GET',
      ...customConfig,
      headers: {
        'Authorization': `Bearer ${keycloak.token}`,
        'Content-Type': 'application/json',
        ...customConfig.headers,
      },
    };

    if (body) {
      config.body = JSON.stringify(body);
    }

	  const response = await fetch(`${BASE_URI}${path}`, config);
 
    if (!response.ok) {
      const { message } = await response.json().catch(() => ({}));
      throw new Error(message || 'Network response failed');
    }

	  return response.status === 204 ? null : response.json();
  }, [keycloak.token]);

  const createDocument = useCallback(
    (title, content) => fetchApi('/docs', {body: {title, content}}).then(parseDocument),
    [fetchApi],
  );
  
  const listDocuments = useCallback(
    () => fetchApi('/docs').then((docs) => docs && docs.map(parseDocument)),
    [fetchApi],
  );

  const getDocument = useCallback(
    (id) => fetchApi(`/docs/${id}`).then(parseDocument),
    [fetchApi],
  );

  const updateDocument = useCallback(
    (id, title, content) => fetchApi(`/docs/${id}`, {method: 'PUT', body: {title, content}}),
    [fetchApi],
  );

  const deleteDocument = useCallback(
    (id) => fetchApi(`/docs/${id}`, {method: 'DELETE'}),
    [fetchApi],
  );

  return {
    createDocument,
	  listDocuments,
	  getDocument,
    updateDocument,
    deleteDocument,
  };
}
