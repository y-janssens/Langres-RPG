import { useCallback, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import { invoke } from '@tauri-apps/api';
import { Navbar, Divider, Button } from 'react-daisyui';
import { useTranslation } from 'react-i18next';

import css from '../Builder/builder.module.css';

export const Header = () => {
    const navigate = useNavigate();
    return (
        <div className={css['builder-navbar-container']}>
            <Navbar dataTheme="dark">
                <div className={css['builder-navbar-top']}>
                    <div className={css['builder-navbar-left']}></div>

                    <div className={css['builder-navbar-toggles']}>
                        <Button dataTheme="business" className={css['builder-navbar-exit']} size="xs" color="accent" shape="square" onClick={() => navigate('/')}>
                            x
                        </Button>
                    </div>
                </div>
            </Navbar>
        </div>
    );
};
