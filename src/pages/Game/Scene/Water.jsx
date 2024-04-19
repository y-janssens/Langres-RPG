import React, { useRef, useMemo } from 'react';
import { TextureLoader, RepeatWrapping, PlaneGeometry, Vector3 } from 'three';
import { extend, useThree, useLoader, useFrame } from '@react-three/fiber';
import { Water } from 'three-stdlib';

extend({ Water });

export default function WaterPlane() {
    const ref = useRef();
    const gl = useThree((state) => state.gl);
    const waterNormals = useLoader(TextureLoader, '/assets/map/water/waternormals.jpeg');
    waterNormals.wrapS = waterNormals.wrapT = RepeatWrapping;

    const geom = new PlaneGeometry(10000, 10000);
    const config = useMemo(
        () => ({
            textureWidth: 1024,
            textureHeight: 1024,
            waterNormals,
            sunDirection: new Vector3(0, 1, 1),
            distortionScale: 1,
            fog: false,
            format: gl.encoding,
            alpha: 1
        }),
        [waterNormals]
    );
    useFrame((_, delta) => (ref.current.material.uniforms.time.value += delta / 10));
    return <water ref={ref} args={[geom, config]} position-y={-0.1} rotation-x={-Math.PI / 2} />;
}
