import { NativeBaseProvider } from 'native-base'
import { AuthContextProvider } from './src/context/AuthContext'
import Presentation from './src/screens/Presentation';

export default function App() {
  return (
    <NativeBaseProvider>
      <AuthContextProvider>
        <Presentation />
      </AuthContextProvider>
    </NativeBaseProvider>
  );
}
