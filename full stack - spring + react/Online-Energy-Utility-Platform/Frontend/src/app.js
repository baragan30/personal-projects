import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import AdministratorPage from './administrator/administrator_page';
import ClientPage from './client/client_page';
import Login from './login/login';

function App() {
    return (
        <div >
            <Router>
                <div>
                    <Routes>
                        <Route
                            path='/*'
                            element={ <Login/>}
                        />
                    </Routes>
                    <Routes>
                        <Route
                            path='/administrator/*'
                            element={ <AdministratorPage/>}
                        />
                    </Routes>
                    <Routes>
                        <Route
                            path='/client/*'
                            element={ <ClientPage/>}
                        />
                    </Routes>
                </div>
            </Router>
        </div>
    );
}

export default App;
