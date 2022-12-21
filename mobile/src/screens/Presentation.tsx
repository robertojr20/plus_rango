import { StatusBar, Text, Center, Button, Circle, useToast } from 'native-base'
import PizzaIcon from '../../assets/pizza_icon.svg'
import HatIcon from '../../assets/hat_icon.svg'
import { useAuth } from '../hooks/useAuth'

export default function Presentation() {
    const { signIn, isUserLoading } = useAuth()
    const toast = useToast()
    return (
        <>
            <Center flex={1} bgColor='#59439C'>
                <Circle size={200} bg='white' rounded='full'>
                    <PizzaIcon width={150} height={150} />
                </Circle>
                <Text color='white' textAlign='center' fontSize='3xl' mt={10} mb={4}>
                    +Rango
                </Text>
                <HatIcon width={100} height={100} />
                <Button
                    w='3xs'
                    h={16}
                    rounded='2xl'
                    mt={10}
                    bgColor='white'
                    _pressed={{
                        bg: 'gray.400'
                    }}
                    onPress={signIn}
                    isLoading={isUserLoading}
                >
                    <Text color='#59439C' fontWeight='bold' fontSize={20}>Estou com fome</Text>
                </Button>
            </Center>
            <StatusBar
                barStyle='light-content'
                backgroundColor='transparent'
                translucent
            />
        </>
    )
}
