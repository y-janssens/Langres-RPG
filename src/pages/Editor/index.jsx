import React from 'react';
import { useNavigate } from 'react-router-dom';
import { Theme, Button } from 'react-daisyui';
import { Header } from './components/Header';

import css from './editor.module.css';

export const Editor = () => {
    return (
        <Theme dataTheme="night" className={css['editor-main-container']}>
            <Header />
            <div className={css['editor-body-container']}>
                <IndexButton label="Home" url="/" />
                <IndexButton label="Editor" url="/admin/editor/builder" />
                <IndexButton label="Collections" url="/admin/editor/collections" />
            </div>
        </Theme>
    );
};

const IndexButton = ({ label, url }) => {
    const navigate = useNavigate();
    return (
        <Button className={css['editor-btn']} dataTheme="business" wide color="primary" size="md" onClick={() => navigate(url)}>
            {label}
        </Button>
    );
};
