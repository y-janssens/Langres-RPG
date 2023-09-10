export default function Character({ position, characterRef }) {
  return (
    <mesh ref={characterRef} scale={[0.55, 1.25, 0.55]} position={position}>
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial color="red" />
    </mesh>
  );
}
