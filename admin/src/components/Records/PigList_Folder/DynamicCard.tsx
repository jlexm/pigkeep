import * as React from 'react';
import { Card, Grid2, ThemeProvider, Typography } from '@mui/material';
import theme from '../../../Theme';

// Define the props type for the data
interface CardData {
  number: number;
  text: string;
}

interface DynamicCardsProps {
  data: CardData[];
  onCardClick: (category: string) => void;
}

const DynamicCards: React.FC<DynamicCardsProps> = ({ data, onCardClick }) => {
  return (
    <ThemeProvider theme={theme}>
      <Grid2 container spacing={1} justifyContent={{xs: 'center', md: 'start'}} className='card'>
        {data.map((item, index) => (
          <Grid2 key={index}>
            <Card
              variant="outlined"
              onClick={() => onCardClick(item.text)}
              sx={{
                textAlign: 'center',
                width: 'clamp(60px, 4vw + 35px, 110px)', // Responsive width
                height: 'clamp(65px, 5vw + 15px, 140px)', // Responsive height
                borderRadius: '10px',
                borderColor: '#000',
                borderWidth: '1px',
                alignContent: 'center',
                alignSelf: 'start',
                cursor: 'pointer',
              }}
            >
              <Typography variant="h5" fontWeight="bold">
                {item.number}
              </Typography>
              <Typography variant="body2">
                {item.text}
              </Typography>
            </Card>
          </Grid2>
        ))}
      </Grid2>
    </ThemeProvider>
  );
};

export default function Cards() {
  const [, setSortCategory] = React.useState<string | null>(null);

  const cardData: CardData[] = [
    { number: 11, text: 'Sows' },
    { number: 14, text: 'Weaners' },
    { number: 10, text: 'Piglets' },
    { number: 4, text: 'Boars' },
    { number: 2, text: 'Growers' },
    // { number: 1, text: 'Matured' }, 
  ];

  return (
    <DynamicCards 
      data={cardData} 
      onCardClick={(category) => setSortCategory(category)}
    />
  );
}
