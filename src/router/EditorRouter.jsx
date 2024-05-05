import React from 'react';
import { Routes, Route } from 'react-router-dom';
import { Collections } from '../pages/Editor/Collections';
// import { Builder } from '../pages/Editor/Builder';
import { Editor } from '../pages/Editor';
import { Builder } from '../pages/Editor/Builder';

export const EditordRouter = () => {
    return (
        <Routes>
            <Route path="/" element={<Editor />} />
            <Route path="builder" element={<Builder />} />
            <Route path="collections" element={<Collections />} />
        </Routes>
    );
};
